import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  actions: {
    addKeyword(collection) {
      let keyword = this.get('store').createRecord('keyword', {
        keyword: this.get('keyword'),
        collection: collection
      });
      keyword.save().then((keyword) => {

      }, (error) => {

      });
    }
  }
});
