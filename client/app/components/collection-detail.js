import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  actions: {
    remove(collection) {
      collection.destroyRecord().then((collection) => {
        this.sendAction('back');
      },
      (error) => {
        this.set('collection', collection);
      });
    },
    save(collection) {
      collection.save().then((collection) => {

      });
    },
  }
});
