import store from '../store'

export const checkLoggedIn = requireLoggedIn => (to, from, next) => {
  if (!store.getters.loggedIn) {
    if (process.env.IS_MOBILE_DEVICE) {
      store.commit('setLoginTarget', to.fullPath)
      next({ name: (
        store.state.mobile.keystore &&
        store.state.mobile.hasMasterKey
      ) ? 'login' : 'intro' })
      return
    } else if (requireLoggedIn) {
      store.commit('setLoginTarget', to.fullPath)
      if (from.name) next(false)
      else next({ name: 'apps' })
      store.commit('toggleRemoteConnectionPrompt')
      return
    }
  }
  next()
}