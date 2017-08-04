import Ember from 'ember';
import DS from 'ember-data';

export default Ember.Component.extend({
  session: Ember.inject.service('session'),
  store: Ember.inject.service(),
  router: Ember.inject.service('-routing'),
  tagName: '',
  user: null,
  actions: {
    submit() {
      let user = this.get('store').createRecord('user');
      let formFields = this.getProperties('name', 'email', 'password', 'password_confirmation');
      let credentials = { identification: this.get('email'), password: this.get('password') };
      user.setProperties(formFields);
      user.save().then((user) => {
        this.set('user', user);
        this.get('session').authenticate('authenticator:jwt', credentials).then(() => {
            this.get('router').transitionTo('profile');
        });
      }, (error) => {
        this.set('user', user);
        user.deleteRecord();
        this.send('error', error);
      });
    },
    error(error, transition) {
      if (error instanceof DS.ServerError) {
        this.get('router').transitionTo('server-down');
      }
    }
 }
});
