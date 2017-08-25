import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    onSuccessLogin() {
      this.transitionToRoute('index');
    }
  }
});
