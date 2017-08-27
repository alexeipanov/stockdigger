import DS from 'ember-data';

export default DS.Model.extend({
  image: DS.attr('number'),
  keyword: DS.attr('number'),
  position: DS.attr('number'),
  date: DS.attr('date'),
});
