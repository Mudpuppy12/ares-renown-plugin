import { computed } from '@ember/object';
import Controller from '@ember/controller';
import { inject as service } from '@ember/service';

export default Controller.extend({
  gameApi: service(),
  flashMessages: service(),
  router: service()
//  chars: computed('model{toplist}', function () {
//        let topchars = this.get('model.toplist.chars');
//        let chars = [];
//        topchars.forEach(function(c) {
//            let char = [];
//            let name = c[name];
//            let total = c[total];
//            char.push(name);
//            char.push(total);
//            chars.push(char);
//        });
//        return topchars;
//    }),

//  houses: computed('model{toplist}', function () {
//        let tophouses = this.get('model.toplist.houses');
//        let houses = [];
//        houses.forEach(function(char_fields) {
//            let char = [];
//            titles.forEach(function(title) {
//                let field = char_fields[title];
//                char.push(field);
//            });
//            chars.push(char);
//        });
//        return tophouses;
//    })

});
