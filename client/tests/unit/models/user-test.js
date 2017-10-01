import { moduleForModel, test } from 'ember-qunit';
import Ember from 'ember';

moduleForModel('user', 'Unit | Model | user', {
  needs: ['model:image']
});

test('it exists', function(assert) {
  let model = this.subject();
  assert.ok(!!model);
});

test('contains images', function(assert) {
  let user = this.store().modelFor('user');
  const relationship = Ember.get(user, 'relationshipsByName').get('images');
  assert.equal(relationship.key, 'images', 'has relationship with image');
  assert.equal(relationship.kind, 'hasMany', 'kind of relationship is hasMany');
});
