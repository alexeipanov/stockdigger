import Ember from 'ember';

export default Ember.Component.extend({
  currentUser: Ember.inject.service('current-user'),
  store: Ember.inject.service(),
  actions: {
    addImage(collection) {
      let image = this.get('store').createRecord('image', {
        image: this.get('image'),
        collection: collection
      });
      image.save().then((image) => {

      }, (error) => {

      });
    }
  }
});
