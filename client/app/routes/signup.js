import Ember from 'ember';

export default Ember.Route.extend({
  pageTitle: 'Sign Up',
  actions: {
		didTransition() {
			this.controller.set('pageTitle', this.get('pageTitle'));
		}
	},

});
