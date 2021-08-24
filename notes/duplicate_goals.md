# Duplicate UserGoal production sentry

## Cause

A user (likely) made two concurrent requests. These were able to get around our validations and make multiple goals of the same category for the same week.

## Steps to repair

### Find bad goals

`user.user_goals.where(started_on: bad_goal.started_on).order(:category)`
This returns a list of the offending goals grouped by category. We will see two of each category.

### Goals where one is set and one is not

Some goal cateogries (`user_set` goals) may have a "good goal" and a "bad goal". The good goal is the one where the `goal` and `set_on` fields are filled in. We should delete the offending goal with the following:

`UserGoal.find(343831).destroy`

```
[ 4] #<UserGoal:0x000055f4074fa618> {
                      :id => 343831,
                :user_id => 10915,
                :category => "exercise",
              :started_on => Sun, 08 Aug 2021,
              :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
              :goal_type => "generated",
                    :goal => nil,
                  :set_on => nil,
},
[ 5] #<UserGoal:0x000055f4074fa438> {
                      :id => 343832,
                :user_id => 10915,
                :category => "exercise",
              :started_on => Sun, 08 Aug 2021,
              :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
              :goal_type => "generated",
                    :goal => 250,
                  :set_on => Sun, 08 Aug 2021,
},
```

### Goals where both are set

Some goal cateogries (non-`user_set` goals) have two set goals because they are automatically set. If the `set_on` is the _same_ for both goods, we can pick the goal to delete at random. If one goal has a more recent `set_on` value, we should delete the other goal, the one with the earlier `set_on`. We should delete the offending goal with the following:

`UserGoal.find(343839).destroy`

```
[ 6] #<UserGoal:0x000055f4074fa230> {
                      :id => 343839,
                :user_id => 10915,
        :recommended_goal => 1,
                :category => "lessons",
              :started_on => Sun, 08 Aug 2021,
            :completed_on => nil,
              :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
              :goal_type => "generated",
                    :goal => 1,
                  :set_on => Sun, 08 Aug 2021,
},
[ 7] #<UserGoal:0x000055f4074fa028> {
                      :id => 343840,
                :user_id => 10915,
        :recommended_goal => 1,
                :category => "lessons",
              :started_on => Sun, 08 Aug 2021,
            :completed_on => nil,
              :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
              :goal_type => "generated",
                    :goal => 1,
                  :set_on => Sun, 08 Aug 2021,
},
```

### Create new set of goals

After bad goals are deleted we can verify that this was successful by running `user.current_user_goals`. If this runs with errors, we know a) we've succeeded and b) we created the new set of goal for the user's current week.

## Future protection

We can add a database constaint to prevent this in the future, but we typically do not prefer these. For the time being we will just observe.
