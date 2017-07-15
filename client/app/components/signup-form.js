import Ember from 'ember';

export default Ember.Component.extend({
  session: Ember.inject.service('session'),
  store: Ember.inject.service(),
  actions: {
    submit() {
      let user = this.get('store').createRecord('user');
      user.set('name', 'Ivan');
      user.set('email', 'Ivan@ivanov.com');
      user.set('password', '456789');
      user.set('password_confirm', '456789');
      user.save();
    //   this.attrs.triggerSave(user);
    }
 }
});
