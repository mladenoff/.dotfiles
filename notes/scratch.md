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