import Ember from 'ember';
import DS from 'ember-data';

export default DS.JSONAPISerializer.extend({
    keyForAttribute: function(attr) {
      return Ember.String.underscore(attr);
    },

    keyForRelationship: function(rawKey) {
      return Ember.String.underscore(rawKey);
    }
});


// app/serializers/application.js
// import Ember from 'ember';
// import JSONAPISerializer from 'ember-data/serializers/json-api';
//
// const { underscore } = Ember.String;
//
// export default JSONAPISerializer.extend({
//
// });
//
