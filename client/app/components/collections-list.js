import Ember from 'ember';

export default Ember.Component.extend({
  currentUser: Ember.inject.service('current-user'),
  store: Ember.inject.service(),
  actions: {
    addCollection() {
      let collection = this.get('store').createRecord('collection', {
        user: this.get('currentUser.user')
      });
      let formFields = this.getProperties('name');
      collection.setProperties(formFields);
      collection.save().then((collection) => {
        this.set('collection', collection);
        this.set('name', '');
      }, (error) => {
        this.set('collection', collection);
        collection.deleteRecord();
      });
    }
  }
});
