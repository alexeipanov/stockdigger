import Ember from 'ember';

export default Ember.Component.extend({
  session: Ember.inject.service('session'),
  actions: {
    authenticate: function() {
      let credentials = this.getProperties('identification', 'password'),
        authenticator = 'authenticator:jwt';
      this.get('session').authenticate(authenticator, credentials).then(
        () => {
          this.sendAction('onSuccess');
        },
        (reason) => {
          this.set('errorMessage', reason.statusText);
        }
      );
    },
    fblogin() {
      this.get('session').authenticate('authenticator:torii', 'facebook').then(
        () => {
          this.sendAction('onSuccess');
        },
        (reason) => {
          this.set('errorMessage', reason.statusText);
        }
      );
    }
  }
});
