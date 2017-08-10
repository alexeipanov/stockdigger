import Ember from 'ember';
export default Ember.Route.extend({
  pageTitle: 'Login',
  actions: {
		didTransition() {
			this.controller.set('pageTitle', this.get('pageTitle'));
		}
	},
});
