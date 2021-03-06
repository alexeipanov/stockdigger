import DS from 'ember-data';

export default DS.Model.extend({
  image: DS.attr('string'),
  url: DS.attr('string'),
  collection: DS.belongsTo('collection', {async: true})
});
