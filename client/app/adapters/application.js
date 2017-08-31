import DS from 'ember-data';
import ENV from 'client/config/environment';
import DataAdapterMixin from 'ember-simple-auth/mixins/data-adapter-mixin';

export default DS.JSONAPIAdapter.extend(DataAdapterMixin, {
  host: `${ENV.baseURI}:${ENV.port}`,
  authorizer: 'authorizer:custom',
  urlForQueryRecord(query) {
    if (query.me) {
      delete query.me;
      return `${this.get('host')}/me`;
    }
    return this._super(...arguments);
  },
});
