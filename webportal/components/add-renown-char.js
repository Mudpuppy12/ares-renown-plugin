import EmberObject, { computed } from '@ember/object';
import Component from '@ember/component';
import { inject as service } from '@ember/service';

export default Component.extend({
    gameApi: service(),
    flashMessages: service(),
    router: service(),
    tagName: '',
    pcRenownName: null,
    pcRenownTitle: null,
    pcRenownPoints: 0,

    getPoints: computed('model{standard_types}', function(selected_type) {
        if (selected_type == 'Freeform') {
           return nil
        }

        let types = this.get('model.people.standard_types');
        let points = 0;
        types.forEach(function(entry) {
            if (entry.type == selected_type) {
               let points = entry.points;
            }
        });
        return points;
    }),

    actions: { 
      
      updateFields(selected_type) {
//        if (selected_type == 'Freeform') {
//           return nil
//        }

//        let points = 0;
        this.types.forEach(function(entry) {
            if (entry.type == selected_type) {
               let points = entry.points;
            }
        });

        this.set('renownTitle', selected_type);
        this.set('renownPoints', points);
        this.updated();
      },

      RenownAddEntry() {
        let api = this.gameApi;
      
        let pcRenownName = this.renownName
        let pcRenownTitle = this.renownTitle
        let pcRenownPoints = this.renownPoints

        if (pcRenownName == null) {
          this.flashMessages.danger("You haven't entered a name.");
          return;
        }

        if (pcRenownTitle == null) {
          this.flashMessages.danger("You haven't entered a title.");
          return;
        }

        if (pcRenownPoints > 10000 || pcRenownPoints < -10000) {
          this.flashMessages.danger("You haven't entered a valid amount for points.");
          return;
        }

        this.set('addRenownEntry',false);
        this.set('pcRenownName', null);
        this.set('pcRenownTitle', null);
        this.set('pcRenownPoints', 0);

        api.requestOne('renownAddEntry', { name: pcRenownName,
           title: pcRenownTitle,
           points: pcRenownPoints }, null)
        .then( (response) => {
          if (response.error) {
            return;
          }
          this.router.transitionTo('char', response.name);
          this.flashMessages.success('A new renown entry has been added!');

        });
      },
    }
});
