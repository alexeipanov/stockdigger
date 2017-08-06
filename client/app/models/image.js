import DS from 'ember-data';

export default DS.Model.extend({
  image: DS.attr('string'),
  user: DS.belongsTo('image', {async: true})
});
