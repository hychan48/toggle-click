<script setup>
/**
 * maybe this should just be in index.html....
 */
</script>

<template>
    <div>
      <button class="topleft" @click="buttonClickEvent" v-text="toggleName"
              :title="'toggle color to '+(!bLazy ? 'very dark gray': 'black')"/>
    </div>
</template>
<script>
export default {
  name:'HelloWorldComponent',
  data() {
    return {
      bLazy: true
    }
  },
  computed: {
    toggleName() {
      let tmp = this.bLazy ? 'very dark gray': 'black'
      return tmp
    }
  },
  methods:{
    buttonClickEvent(){
      if(this.bLazy){
        this.bLazy = false;
        return window.document.body.setAttribute('class','black')
      }
      this.bLazy = true;
      window.document.body.setAttribute('class','')
    }
  }
}
</script>
<style>
body.black {
  background-color: black;
}
button.topleft {
  /*https://www.w3schools.com/css/css_positioning.asp*/
  position: fixed;
  top: 0;
  left: 0;
  background-color: darkred;
}
</style>
