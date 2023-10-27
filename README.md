# Ares Renown Plugin
A plugin for handling renown - useful in games where points are awarded for deeds or achievements. 

## Credits
Lyanna @ AresCentral

## Overview
Wherever progress is awarded based on IC achievements, be it for the individual character or the family or organisation they are part of, game staff may award points and review them at certain times to decide an improvement or worsening of their situation. This system is based on the idea of seasons, meaning that renown points can be reset with the start of each new season.

The respective amounts for awarded renown points are up to admin, but within this system it is possible to define certain standard types that come with default amount suggestions. Even if visibility of renown details can be configured through a setting within the renown.yml config file, I'd recommend visibility for the sake of transparency.

### What this plugin covers
* Admin: Awarding points, viewing current renown, resetting renown of all characters. Both from the game client and the webportal. Please note that the name of the admin awarding the points will be listed in the entries of the webportal view and game client view, for reasons of transparency.
* Players: View their current renown status, their renown entries and respective points, both from the game client and the webportal.
* Webportal: Renown Management route, where admin can view character points and family/org points, add entries, reset points.
* Webportal: Renown top ranking lists route. This includes now links to char pages and optional links to wiki org pages.
* Game client: renown/top command to view top ranking lists on game.
* Regular cron job to post an announcement of the character who has earned the most renown in a specified time span.
* 'renown' can be easily changed into another expression (i.e. fame, influence, glory, etc), so that the plugin may be applicable to a wider range of games. 

## Screenshots
### Game client and webportal views of the 'renown/view' command
![ren-own-view-client](/images/renown_view_client.PNG)

![ren-own-view-webportal](/images/renown_view_webportal.PNG)

If 'visible' flag is set to 'false' in the config, this view is only available for the respective character and admin. Otherwise visible to all.
This view is part of the character page on the webportal.

### Webportal view of the renown management route (admin)
![renown-management-webportal](/images/renown_management_webportal.PNG)

The renown management route is borrowed in part from the census code. The route is only available to admin and coder roles.

Please note the nav bar at the top that allows you to switch to a view of a single houses/organizations. The list is generated dynamically from all orgs of approved renown characters. Unplayed orgs won't get listed.

Adding new renown entries and resetting all renown can be triggered through the buttons at the bottom.

![add-entry-webportal](/images/renown_add_entry_webportal.PNG)

![reset-renown-webportal](/images/renown_reset_webportal.PNG)


### Webportal view of the renown management org route (admin)
![renown-management-org](/images/renown_management_org_webportal.PNG)

Here we have the view for a single org. This view is limited to admin and coder roles. 

### Renown Ranking Views

![renown-top-client](/images/renown_top_client.PNG)

![renown-top-webportal](/images/renown_top_webportal.PNG)

## Installation
In the game, run: plugin/install https://github.com/cailleach1310/ares-renown-plugin

### Updating Custom Profile Files
This plugin is relatively easy in regards to updating custom files, as it only requires profile and route adjustments. If you do not have any existing edits to these custom files, you can use the files in+ the custom_files folder of this repository as-is. If you do, then you may use them as templates to add the lines of code needed for the renown plugin.

#### aresmush/plugins/profile/custom_char_fields.rb
Update with: custom_files/custom_char_fields.rb

#### ares-webportal/app/custom-routes.js
Update with: custom_files/custom-routes.js

#### ares-webportal/app/templates/components/profile-custom.hbs
Update with: custom_files/profile-custom.hbs

#### ares-webportal/app/templates/components/profile-custom-tabs.hbs
Update with: custom_files/profile-custom-tabs.hbs

## Configuration

### CSS file
Please add the following lines to your AdesMUSH CSS file:

    .renown-line {
      padding: 5px;
      border-bottom: 1px solid #c0c0c0; }

### Other plugins

#### /aresmush/game/config/website.yml
Add a route to the top bar menu for the admin management page. This route is limited to admin and coder roles. 
Add a route for the renown top rankings. This route is limited to logged in players and admins.

For example:

      top_navbar:
    (...)
    - title: System
      menu:
        - title: Renown - Rankings
          route: renown-top
        - title: Manage Renown
          route: renown-management
    (...)

### renown.yml 
You don't have to modify the renown.yml for the plugin to work, but you can make adjustments here. The keys in the yaml are explained below.

#### achievements
The plugin comes with two predefined achievements. More can be added here.

#### cron_message_category
This is the forum category that the regular cron job will post to. Default is "Announcements".

#### cron_message_title
Title for the regular forum post, as this will depend on context and time span.

#### cron_regular_check
Configure here the time at which the cron job will run. If you don't want it to run at all, change this entry to "{}".

#### cron_renown_days
This value defines the number of days that will be considered for the regular renown check.

#### org_links
This option pertains to the renown-top route, it is set to 'false' by default. If you have org pages defined on your wiki, you can enable org links by setting this option to 'true'.

#### org_page_prefix
This option pertains to the renown-top route. Define here an optional prefix to org pages in the game wiki section. Per default this is set to '{}', meaning that org links will have identical org page names. If you have a more refined org page name definition, you'll have to specify the org page prefix here, see the example below. Org links will only show if the option 'org_links' is set to 'true'.

![org_page_prefix_example](/images/org_page_prefix.PNG)

#### renown_group
Define here the group that will as family/organisation benefit from their members' renown. For example "house" or "family". Please use lowercase for this entry.

#### renown_members
Here you can define which kinds of characters are considered in the renown system. Entries will be "group" and "value", for instance "faction" and "Noble". If you change this to "{}", all approved characters will be considered.

     renown_members:
     - group: faction
       value: Noble

#### renown_title
This is where you define the expression used for renown in your game, if "Renown" doesn't work for you and you want to change it into something else.

#### shortcuts
Here is a space where you can define shortcuts for the commands.

#### standard_types
Here you can define various standard types for renown entries when working with the renown management route in the webportal. Use "type" for the name, and you can set points to positive or negative values. See the examples below. This can make adding new entries for characters easier.

     standard_types:
     - type: Freeform
       points: 0
     - type: Minor Scandal
       points: -50
     - type: Heroic Deed
       points: 250

#### visible
Set this to "false", if you don't want renown to be visible to other players. Default is "true".

#### web_renown_total_fields
These entries are listed in the renown management route and can be configured here.

### Optional: Replace 'renown' with another expression
Maybe the expression 'renown' doesn't quite fit what you need for your game. For example, 'glory' might be a better choice, or something else entirely.

#### Modify the Config File 
Simply replace 'Renown' with the expression of your choice in the key 'renown_title'. This should affect relevant routes in the webportal and templates in the game client.

#### Defining Aliases for the Commands
Clientside, aliases need to be added to the 'renown.yml' as shortcuts, as you'll probably wish to use the new expression for the client commands. See the example below. Don't forget to 'load renown' from the game client after applying your changes to the 'renown.yml' file.

     shortcuts:
       influence/add: renown/add
       influence/group: renown/group
       influence/reset: renown/reset
       influence/top: renown/top
       influence/view: renown/view
       influence/all: renown/all

#### Adjusting the Help Files
You'll need to adjust the help files in the folder /plugins/renown/help/en/. Rename them and edit them.

#### Further Adjustments
Custom profile files may have to be adjusted, also some website menu entries.

### Updating to Latest Version with Char and Org Links (Renown-Top Route)
If you have this plugin installed in an earlier version and want to update to this version:
- Run the install from the game client again (see above).
- Add the following keys to your renown.yml config: *org_links* and *org_page_prefix*, at least with their default values. These keys are explained above. They have to be added manually, because your existing renown.yml won't be modified through a reinstall of the plugin. **Don't replace your old renown.yml with the new renown.yml from this repository if you've already made changes to the renown config!**

## Uninstallation
Removing the plugin requires some code fiddling. See [Uninstalling Plugins](https://www.aresmush.com/tutorials/code/extras.html#uninstalling-plugins).

## License
Same as [AresMUSH](https://aresmush.com/license).
