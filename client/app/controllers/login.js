import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    onSuccessLogin() {
      // this.transitionTo('profile');
      this.transitionToRoute('profile');
    }
  }
});
