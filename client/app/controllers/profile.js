import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Controller.extend(AuthenticatedRouteMixin, {
    currentUser: Ember.inject.service('current-user'),
    session: Ember.inject.service('session'),
    model() {
      return this.get('currentUser').load();
  },
    actions: {
        logout() {
            this.get('session').invalidate();
        }
    }
});
