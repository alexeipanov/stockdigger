import DS from 'ember-data';
import DataAdapterMixin from 'ember-simple-auth/mixins/data-adapter-mixin';

export default DS.JSONAPIAdapter.extend(DataAdapterMixin, {
  host: 'http://localhost:3000',
  authorizer: 'authorizer:custom',
  urlForQueryRecord(query) {
    if (query.me) {
      delete query.me;
      return `${this.get('host')}/me`;
    }
    return this._super(...arguments);
  },
});
