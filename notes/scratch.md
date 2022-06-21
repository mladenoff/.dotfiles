Hey Maria, nice summary.
It's not that `#exists?` has been deprecated since Rails 3, it's that `ActiveRecord::Base#exists?`
was deprecated when `#exists?` was moved over to `ActiveRecord::FindeMethods#exists?`. It still is very much part of Rails, and it works differently than `#present?`. As an active record method, `#exists?` does all the work in the database and winds up being about twice as fast as `#present?`.

```ruby
    context 'source is pwn_health' do
      let!(:weight_4) { create(:weight, user: user, grams: 81_000,  source: 'pwn_health') }

      before do
        Timecop.freeze(Time.zone.local(2017, 5, 1, 4))
        weight_4.update!(confirmed_at: Time.zone.now)
      end

      it 'does not delete a weight from pwn_health' do
        delete "/weights/#{weight_4.id}.json", params: params.to_json, headers: http_headers(user)

        expect(weight_4.accepted).to eq true
        expect(weight_4.confirmed_at).to eq Time.zone.now
      end
    end
```

```
# [
    # [ 0] #<UserGoal:0x000055f4074fadc0> {
    #                      :id => 343844,
    #                 :user_id => 10915,
    #            :goal_tier_id => nil,
    #        :recommended_goal => 7,
    #                :category => "bloodGlucoses",
    #              :started_on => Sun, 08 Aug 2021,
    #            :completed_on => nil,
    #              :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #              :updated_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #               :goal_type => "generated",
    #                    :goal => 7,
    #                  :set_on => Sun, 08 Aug 2021,
    #     :white_box_record_id => nil,
    #                 :version => 2
    # },
    # [ 1] #<UserGoal:0x000055f4074fabb8> {
    #                      :id => 343843,
    #                 :user_id => 10915,
    #            :goal_tier_id => nil,
    #        :recommended_goal => 7,
    #                :category => "bloodGlucoses",
    #              :started_on => Sun, 08 Aug 2021,
    #            :completed_on => nil,
    #              :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #              :updated_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #               :goal_type => "generated",
    #                    :goal => 7,
    #                  :set_on => Sun, 08 Aug 2021,
    #     :white_box_record_id => nil,
    #                 :version => 2
    # },
    # [ 2] #<UserGoal:0x000055f4074fa9d8> {
    #                      :id => 343842,
    #                 :user_id => 10915,
    #            :goal_tier_id => nil,
    #        :recommended_goal => 7,
    #                :category => "bloodPressures",
    #              :started_on => Sun, 08 Aug 2021,
    #            :completed_on => nil,
    #              :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #              :updated_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #               :goal_type => "generated",
    #                    :goal => 7,
    #                  :set_on => Sun, 08 Aug 2021,
    #     :white_box_record_id => nil,
    #                 :version => 2
    # },
    # [ 3] #<UserGoal:0x000055f4074fa7f8> {
    #                      :id => 343841,
    #                 :user_id => 10915,
    #            :goal_tier_id => nil,
    #        :recommended_goal => 7,
    #                :category => "bloodPressures",
    #              :started_on => Sun, 08 Aug 2021,
    #            :completed_on => nil,
    #              :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #              :updated_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #               :goal_type => "generated",
    #                    :goal => 7,
    #                  :set_on => Sun, 08 Aug 2021,
    #     :white_box_record_id => nil,
    #                 :version => 2
    # },
    # [ 4] #<UserGoal:0x000055f4074fa618> {
    #                      :id => 343831,
    #                 :user_id => 10915,
    #            :goal_tier_id => nil,
    #        :recommended_goal => 300,
    #                :category => "exercise",
    #              :started_on => Sun, 08 Aug 2021,
    #            :completed_on => nil,
    #              :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #              :updated_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #               :goal_type => "generated",
    #                    :goal => nil,
    #                  :set_on => nil,
    #     :white_box_record_id => nil,
    #                 :version => 2
    # },
    # [ 5] #<UserGoal:0x000055f4074fa438> {
    #                      :id => 343832,
    #                 :user_id => 10915,
    #            :goal_tier_id => nil,
    #        :recommended_goal => 300,
    #                :category => "exercise",
    #              :started_on => Sun, 08 Aug 2021,
    #            :completed_on => nil,
    #              :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #              :updated_at => Sun, 08 Aug 2021 17:01:47 UTC +00:00,
    #               :goal_type => "generated",
    #                    :goal => 250,
    #                  :set_on => Sun, 08 Aug 2021,
    #     :white_box_record_id => nil,
    #                 :version => 2
    # },
    # [ 6] #<UserGoal:0x000055f4074fa230> {
    #                      :id => 343839,
    #                 :user_id => 10915,
    #            :goal_tier_id => nil,
    #        :recommended_goal => 1,
    #                :category => "lessons",
    #              :started_on => Sun, 08 Aug 2021,
    #            :completed_on => nil,
    #              :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #              :updated_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #               :goal_type => "generated",
    #                    :goal => 1,
    #                  :set_on => Sun, 08 Aug 2021,
    #     :white_box_record_id => nil,
    #                 :version => 2
    # },
    # [ 7] #<UserGoal:0x000055f4074fa028> {
    #                      :id => 343840,
    #                 :user_id => 10915,
    #            :goal_tier_id => nil,
    #        :recommended_goal => 1,
    #                :category => "lessons",
    #              :started_on => Sun, 08 Aug 2021,
    #            :completed_on => nil,
    #              :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #              :updated_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #               :goal_type => "generated",
    #                    :goal => 1,
    #                  :set_on => Sun, 08 Aug 2021,
    #     :white_box_record_id => nil,
    #                 :version => 2
    # },
    # [ 8] #<UserGoal:0x000055f4074f9df8> {
    #                      :id => 343834,
    #                 :user_id => 10915,
    #            :goal_tier_id => nil,
    #        :recommended_goal => 18,
    #                :category => "meals",
    #              :started_on => Sun, 08 Aug 2021,
    #            :completed_on => nil,
    #              :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #              :updated_at => Sun, 08 Aug 2021 17:00:53 UTC +00:00,
    #               :goal_type => "generated",
    #                    :goal => 18,
    #                  :set_on => Sun, 08 Aug 2021,
    #     :white_box_record_id => nil,
    #                 :version => 2
    # },
    # [ 9] #<UserGoal:0x000055f4074f9ad8> {
    #                      :id => 343833,
    #                 :user_id => 10915,
    #            :goal_tier_id => nil,
    #        :recommended_goal => 18,
    #                :category => "meals",
    #              :started_on => Sun, 08 Aug 2021,
    #            :completed_on => nil,
    #              :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #              :updated_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #               :goal_type => "generated",
    #                    :goal => nil,
    #                  :set_on => nil,
    #     :white_box_record_id => nil,
    #                 :version => 2
    # },
    # [10] #<UserGoal:0x000055f4074f9628> {
    #                      :id => 343837,
    #                 :user_id => 10915,
    #            :goal_tier_id => nil,
    #        :recommended_goal => 1,
    #                :category => "skills",
    #              :started_on => Sun, 08 Aug 2021,
    #            :completed_on => nil,
    #              :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #              :updated_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #               :goal_type => "generated",
    #                    :goal => 1,
    #                  :set_on => Sun, 08 Aug 2021,
    #     :white_box_record_id => nil,
    #                 :version => 2
    # },
    # [11] #<UserGoal:0x000055f4074f91a0> {
    #                      :id => 343838,
    #                 :user_id => 10915,
    #            :goal_tier_id => nil,
    #        :recommended_goal => 1,
    #                :category => "skills",
    #              :started_on => Sun, 08 Aug 2021,
    #            :completed_on => nil,
    #              :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #              :updated_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
    #               :goal_type => "generated",
    #                    :goal => 1,
    #                  :set_on => Sun, 08 Aug 2021,
    #     :white_box_record_id => nil,
    #                 :version => 2
    # },
#     [12] #<UserGoal:0x000055f4074f8f70> {
#                          :id => 343836,
#                     :user_id => 10915,
#                :goal_tier_id => nil,
#            :recommended_goal => 7,
#                    :category => "weights",
#                  :started_on => Sun, 08 Aug 2021,
#                :completed_on => nil,
#                  :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
#                  :updated_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
#                   :goal_type => "generated",
#                        :goal => 7,
#                      :set_on => Sun, 08 Aug 2021,
#         :white_box_record_id => nil,
#                     :version => 2
#     },
#     [13] #<UserGoal:0x000055f4074f8d18> {
#                          :id => 343835,
#                     :user_id => 10915,
#                :goal_tier_id => nil,
#            :recommended_goal => 7,
#                    :category => "weights",
#                  :started_on => Sun, 08 Aug 2021,
#                :completed_on => nil,
#                  :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
#                  :updated_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
#                   :goal_type => "generated",
#                        :goal => 7,
#                      :set_on => Sun, 08 Aug 2021,
#         :white_box_record_id => nil,
#                     :version => 2
#     }
# ]
```
```
src/auth/sagas/verifyLoggedIn.js
src/common/components/Header.js
src/enrollment/components/EnrollmentConfirmation.js
src/enrollment/components/MemberAccountConfirmation.js
src/enrollment/components/tests/MemberAccountConfirmation.test.js
src/enrollment/components/tests/__snapshots__/EnrollmentConfirmation.test.js.snap
src/enrollment/components/tests/__snapshots__/MemberAccountConfirmation.test.js.snap
src/enrollment/reducers/index.js
src/enrollment/utils/roleHelpers.js
src/modals/components/StudyInfoModal.js
src/modals/components/tests/__snapshots__/StudyInfoModal.test.js.snap
src/sagas.js
src/user/actionCreators/index.js
src/user/actions/index.js
src/user/reducers/index.js
src/user/sagas/loadUser.js
```

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

Some goal cateogries (non-`user_set` goals) have two set goals because they are automatically set. If the `set_on` and We should delete the offending goal with the following:

`UserGoal.find(343831).destroy`

```
[ 6] #<UserGoal:0x000055f4074fa230> {
                      :id => 343839,
                :user_id => 10915,
        :recommended_goal => 1,
                :category => "lessons",
              :started_on => Sun, 08 Aug 2021,
            :completed_on => nil,
              :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
              :updated_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
              :goal_type => "generated",
                    :goal => 1,
                  :set_on => Sun, 08 Aug 2021,
    :white_box_record_id => nil,
                :version => 2
},
[ 7] #<UserGoal:0x000055f4074fa028> {
                      :id => 343840,
                :user_id => 10915,
        :recommended_goal => 1,
                :category => "lessons",
              :started_on => Sun, 08 Aug 2021,
            :completed_on => nil,
              :created_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
              :updated_at => Sun, 08 Aug 2021 12:45:16 UTC +00:00,
              :goal_type => "generated",
                    :goal => 1,
                  :set_on => Sun, 08 Aug 2021,
    :white_box_record_id => nil,
                :version => 2
},
```