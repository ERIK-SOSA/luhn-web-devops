<template>
  <v-row>
    <v-col cols="10" lg="4" class="mx-auto">
      <v-card class="form-center pa-4">
        <div class="text-center">
          <v-avatar size="100" color="indigo lighten-4">
            <v-icon size="40" color="indigo">mdi-account</v-icon>
          </v-avatar>
          <h2 class="indigo--text">Login Page</h2>
        </div>
        <v-form @submit.prevent="submitHandler" ref="form">
          <v-card-text>
            <v-text-field
                v-model="email"
                :rules="emailRules"
                type="email"
                label="Email"
                placeholder="Email"
                prepend-inner-icon="mdi-account">
            </v-text-field>
            <v-text-field
                v-model="password"
                :rules="passwordRules"
                :type="passwordShow ? 'text': 'password'"
                label="Password"
                placeholder="Password"
                prepend-inner-icon="mdi-key"
                :append-icon="passwordShow ? 'mdi-eye' : 'mdi-eye-off'"
                @click:append="passwordShow = !passwordShow"
            >
            </v-text-field>
          </v-card-text>
          <v-card-actions class="justify-center">
            <v-btn :loading="loading" type="submit" color="indigo">
              <span class="white--text px-8">LOGIN</span>
            </v-btn>
          </v-card-actions>
        </v-form>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
import axios from "axios";

export default {
  name: 'HelloWorld',

  data: () => ({
    passwordShow: false,
    loading: false,
    password: '',
    passwordRules: [
      v => !!v || 'La contraseña es requerida',
    ],
    email: '',
    emailRules: [
      v => !!v || 'El Email es requerido',
      v => /.+@.+\..+/.test(v) || 'El Email debe de ser valido'
    ]
  }),
  methods: {
    submitHandler() {
      this.loading = true;
      if(this.$refs.form.validate()){
        this.setLogin();
      }
      this.loading = false;
    },
    setLogin(){
      let data = {
        email: this.email,
        password: this.password
      }
      axios.post("http://localhost:3000/login", data).then((response) => {
        console.log('Data response', response.data);
        if(response.data) {
          this.$showNaVBarLogin = false;
          this.$router.push('/inicio')
        }

      })
    }
  }
}
</script>
<style>
.form-center {
  margin-top: 40%;
}
</style>
