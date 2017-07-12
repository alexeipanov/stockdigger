import Devise from 'ember-simple-auth/authenticators/devise';
import ENV from 'client/config/environment';
export default Devise.extend({
    serverTokenEndpoint: 'http://localhost:' + ENV.port + '/api/users/sign_in',
});
