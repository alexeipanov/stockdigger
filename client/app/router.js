import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function() {
  this.route('login');
  this.route('profile');
  this.route('signup');
  this.route('server-down');

  this.route('dashboard');

  this.route('index', { path: '/' }, function() {
    this.route('collections');
    this.route('collection', { path: '/collections/:collection_id' }, function() {
      // this.route('keyword'
        // , { path: '/collections/:collection_id/keywords/:keyword_id' }
        // );
    });
    this.route('images');
    this.route('keywords');
    this.route('image', { path: '/images/:image_id' });
  });
});

export default Router;
