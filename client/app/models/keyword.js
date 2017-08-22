import DS from 'ember-data';

export default DS.Model.extend({
  keyword: DS.attr('string'),
  collection: DS.belongsTo('collection', {async: true})
});
