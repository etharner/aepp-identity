<template>
  <ae-identity-background
    class="quick-id"
    type="dramatic"
    @click="showIdManager">
    <template v-if="showBackButton">
      <router-link
        :to="{ name: 'apps' }"
        class="back-button"
        @click.native.stop
      />
      <div class="vertical-ruler" />
    </template>
    <ae-identity-light
      v-bind="identity"
      active
      collapsed
      invert />
    <ae-icon
      name="chevron"
      rotate="270"
      type="dramatic"
      invert />
  </ae-identity-background>
</template>

<script>
import { mapGetters } from 'vuex';
import { AeIdentityBackground, AeIdentityLight, AeIcon } from '@aeternity/aepp-components';

export default {
  name: 'QuickId',
  components: { AeIdentityBackground, AeIdentityLight, AeIcon },
  props: {
    'show-back-button': { type: Boolean, default: false },
  },
  computed: mapGetters({
    identity: 'activeIdentity',
  }),
  methods: {
    showIdManager() {
      this.$store.commit('toggleIdManager');
    },
  },
};
</script>

<style scoped lang="scss">
.quick-id {
  position: fixed;
  bottom: 20px;
  left: 50%;
  transform: translateX(-50%);
  width: calc(100% - 40px);
  max-width: 350px;
  cursor: pointer;
  align-items: center;

  .back-button {
    width: 25px;
    height: 25px;
    background: url('../assets/icons/grid.svg') no-repeat;
    background-size: contain;
  }

  .vertical-ruler {
    margin: 0 15px;
    height: 30px;
    background-color: rgba(#ffffff, .5);
    width: 2px;
  }

  .ae-identity-light {
    flex-grow: 1;
    margin-right: 10px;
  }
}
</style>
