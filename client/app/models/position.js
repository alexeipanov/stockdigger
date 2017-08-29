import DS from 'ember-data';

export default DS.Model.extend({
  image_id: DS.attr('number'),
  keyword_id: DS.attr('number'),
  position: DS.attr('number'),
  created_at: DS.attr('date'),
});
