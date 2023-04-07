import EmberObject, { computed } from '@ember/object';
import Component from '@ember/component';
import { inject as service } from '@ember/service';

export default Component.extend({
    gameApi: service(),
    flashMessages: service(),
    router: service(),
    tagName: '',

    actions: {
      ResetAllRenown() {
        let api = this.gameApi;
        this.set('resetAllRenown',false);

        api.requestOne('renownResetAll', {}, null)
            .then( (response) => {
                if (response.error) {
                    return;
                }
                this.flashMessages.success('All renown points have been cleared!');
                this.send('reloadModel');
            });
       },
   }

});
