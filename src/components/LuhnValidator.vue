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

<script>

import axios from "axios";

export default {

  name: "LuhnValidator",

  data: () => ({
    number: null,
    loading: false,
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
      axios.post("http://localhost:3000/validacion-luhn", data).then((response) => {
        console.log('Data response', response.data);
        if(response.data) {
          console.log('numero valido');console.log(true);
        }else{
          console.log('numero no valido');console.log(true);
        }

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
