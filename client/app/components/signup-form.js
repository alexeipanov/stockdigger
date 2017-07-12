import Ember from 'ember';

// const { service } = Ember.inject;

export default Ember.Component.extend({
  session: Ember.inject.service('session'),
  actions: {
    submit() {
      let user = this.get('user');
      this.attrs.triggerSave(user);
    }
 }
});
