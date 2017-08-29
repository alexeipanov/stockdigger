import Ember from 'ember';
import DS from 'ember-data';

export default DS.JSONAPISerializer.extend({
    keyForAttribute: function(attr) {
      return Ember.String.underscore(attr);
    },

    keyForRelationship: function(rawKey) {
      return Ember.String.underscore(rawKey);
    },

    normalizeResponse(store, primaryModelClass, payload) {
      if (Array.isArray(payload.data)) {
        payload.data.map(function(element) {
          Object.keys(element.attributes).map((item) => {
            if (item === Ember.String.underscore(item)) {
              return;
            }
            element.attributes[Ember.String.underscore(item)] = element.attributes[item];
            delete element.attributes[item];
          });
          return element;
        });
      } else {
        Object.keys(payload.data.attributes).map((item) => {
          if (item === Ember.String.underscore(item)) {
            return;
          }
          payload.data.attributes[Ember.String.underscore(item)] = payload.data.attributes[item];
          delete payload.data.attributes[item];
        });
      }
      return this._super(...arguments);
    },
});
