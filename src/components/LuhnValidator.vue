<template>
<v-container>
  <p>El servicio de  Luhn TEST </p>
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
                :rules=[cardNumberRules.checkCardValid(number)]
                type="number"
                label="Ingrese numero"
                
                prepend-inner-icon="mdi-credit-card">
            </v-text-field>
          </v-card-text>
          <v-card-actions class="justify-center">
           <!-- <v-btn :loading="loading" type="submit" color="indigo">
              <span class="white--text px-8">Validar</span>
            </v-btn>-->
          </v-card-actions>
        </v-form>
      </v-card>
    </v-col>
  </v-row>
</v-container>

</template>

<script>

export default {

  name: "LuhnValidator",

  data: () => ({
    number: null,
  
    cardNumberRules: {
		checkCardValid(value) {
     // return /.+@.+\..+/.test(value) || "Email valido"
	if (/[^0-9-\s]+/.test(value)) return false;


  // eslint-disable-next-line no-unused-vars
  let nCheck = 0, nDigit = 0, bEven = false;

console.log("todo bien aca")
	value = value.toString().replace(/\D/g, "");

	for (let n = value.length - 1; n >= 0; n--) {
		let cDigit = value.charAt(n),
			nDigit = parseInt(cDigit, 10);

		if (bEven) {
			if ((nDigit *= 2) > 9) nDigit -= 9;
		}

		nCheck += nDigit;
		bEven = !bEven;
	}
  
 console.log((nCheck % 10) == 0)
 if((nCheck % 10) == 0){  return "TarjetaValida"}else{return "Tarjeta no valida"}
	//return (nCheck % 10) == 0;
			
		}      
    }
  }),

  methods: {


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