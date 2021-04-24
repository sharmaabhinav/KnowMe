namespace :backfill do
  desc "Set active fag for backdated users"
  task active_flag_backfill_for_user: :environment do
    users = User.all
    users.each do |user|
      unless user.active.present?
        user.active = true
        user.save
      end
    end
  end

  desc "Set active fag for backdated facts"
  task active_flag_backfill_for_fact: :environment do
    facts = Fact.all
    facts.each do |fact|
      unless fact.active.present?
        fact.active = true
        fact.save
      end
    end
  end
end
