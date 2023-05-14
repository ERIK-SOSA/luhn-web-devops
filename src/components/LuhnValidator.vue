<template>
<v-container>
  <v-row>
    <v-col cols="10" lg="4" class="mx-auto">
      <v-card class="form-center pa-4">
        <div class="text-center">

          <h2 class="indigo--text">Validacion de Luhn</h2>
        </div>
        <v-form @submit.prevent="submitHandler" ref="form">
          <v-card-text>
            <v-text-field
                v-model="number"
                type="number"
                label="Ingrese numero"
                prepend-inner-icon="mdi-credit-card">
            </v-text-field>
          </v-card-text>
          <v-card-actions class="justify-center">
           <v-btn :loading="loading" type="submit" color="indigo">
              <span class="white--text px-8">Validar</span>
            </v-btn>
          </v-card-actions>
        </v-form>
      </v-card>
    </v-col>
  </v-row>
</v-container>

</template>
<script src="vue-swal/dist/vue-swal.js"></script>
<script src="https://unpkg.com/vue-swal"></script>
<script>

import axios from "axios";

export default {

  name: "LuhnValidator",

  data: () => ({
    number: null,
    loading: false,
    api_endpoint: process.env.VUE_APP_SERVER_URL+'/validartarjeta'
  }),

  methods: {
    submitHandler() {
      this.loading = true;
      if(this.$refs.form.validate()){
        this.setValidation();
      }
      this.loading = false;
      
    },
    setValidation(){
      let data = {
        creditCardNumber: this.number
      }
      console.log('ENVIRONMENT_URL: ', process.env.VUE_APP_SERVER_URL)
      console.log('ENVIRONMENT_URL: ', this.api_endpoint)
      axios.post(this.api_endpoint || "http://localhost:3000/validartarjeta", data).then((response) => {
        console.log('Data response', response.data);
        if(response.data.result) {
          this.$swal("¡Listo!",response.data.message,"success");
          console.log('numero valido');
        }else{
          this.$swal("¡Error!", response.data.message,"error");
          console.log('numero no valido');
        }
      }).catch( error => {
        // handle error
        // console.log('Error catched: ' , error.response.data);
        this.$swal("¡Error!", error.response.data.message,"warning")
      })
    }
  }

}
</script>

<style scoped>
.center-input{
  background: yellow;
  height: 150px;
  width: 300px;
  justify-content: center;
  align-items: center;
}
.TarjetaValida {
  color: green;
}


</style>
