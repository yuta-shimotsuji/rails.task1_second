class Schedule < ApplicationRecord

    validates:title,presence: true,length:{minimum:1,maximum:20}
    validates:memo,length:{maximum:500}
    validates:start_day,presence: true
    validates:last_day,presence: true
    validate :start_last_check

    def start_last_check
        errors.add(:last_day, "の日付を正しく記入してください。") unless
        self.start_day <= self.last_day
    end

end
