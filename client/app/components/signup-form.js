import Ember from 'ember';

export default Ember.Component.extend({
  session: Ember.inject.service('session'),
  store: Ember.inject.service(),
  tagName: '',
  actions: {
    submit() {
      let user = this.get('store').createRecord('user');
      let formFields = this.getProperties('name', 'email', 'password', 'password_confirmation');
      user.setProperties(formFields);
      user.save().then((user) => {

      }, (error) => {
        console.log(error);
        this.set('errorMessage', error)
      });
    }
 }
});
