module AresMUSH
  module Renown
    class CronEventHandler
     
      def on_event(event)
        config = Global.read_config("renown", "regular_check_cron")
        if Cron.is_cron_match?(config, event.time)
          Global.logger.debug "Checking current renown."
          name = Renown.get_max_renown_char
          points = Renown.calculate_gained(name)
          title = "Favorite of the Week: " + name
          Forum.system_post(
            Global.read_config("renown", "renown_category"),
            title, 
            t('renown.weekly_favorite_message', :name => name, :points => points))
          target = Character.find_one_by_name(name)
          Achievements.award_achievement(target, "renown_leading")
        end
      end 

    end
  end
end
