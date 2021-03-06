import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  email: DS.attr('string'),
  password: DS.attr('string'),
  password_confirmation: DS.attr('string'),
  images: DS.hasMany('images', {async: true}),
  collections: DS.hasMany('collections', {async: true})
});
