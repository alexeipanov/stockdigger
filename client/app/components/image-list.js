import Ember from 'ember';

export default Ember.Component.extend({
   classNames: ['image-grid'],
   actions: {
     remove(image) {
       image.destroyRecord().then((image) => {
         this.set('image', image);
       },
       (error) => {
         this.set('image', image);
       });
     },
   }
});
