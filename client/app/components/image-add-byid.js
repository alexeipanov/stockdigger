import Ember from 'ember';

export default Ember.Component.extend({
  currentUser: Ember.inject.service('current-user'),
  store: Ember.inject.service(),
  actions: {
    addImage() {
      let image = this.get('store').createRecord('image', {
        user: this.get('currentUser.user')
      });
      let formFields = this.getProperties('image');
      image.setProperties(formFields);
      image.save().then((image) => {

      }, (error) => {

      });
    }
  }
});
