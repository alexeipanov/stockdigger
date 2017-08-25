import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  user: DS.belongsTo('user', {async: true}),
  keywords: DS.hasMany('keyword', {async: true})
});