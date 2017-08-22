import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    remove(keyword) {
      keyword.destroyRecord().then((keyword) => {
        this.set('keyword', keyword);
      },
      (error) => {
        this.set('keyword', keyword);
      });
    },
    save(keyword) {
      keyword.save().then((keyword) => {
        console.log('success');
      });
    },
  }
});
