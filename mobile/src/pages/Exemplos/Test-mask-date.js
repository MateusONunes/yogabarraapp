// https://inducesmile.com/react-native-source-code/how-to-mask-text-input-in-react-native/

import React from 'react'
import { View, TextInput , StyleSheet } from 'react-native';
import Constants from 'expo-constants'
import TextInputMask from 'react-native-text-input-mask';
//import styles from './ArquivoStyle'

export default function Test() {
  return (
    <View style={[styles.conatiner, {marginTop: 20}]}>
      <TextInput 
        name="teste"
        style={styles.inputText}

//        refInput={ref => { this.input = ref }}
//        onChangeText={(formatted, extracted) => {
//                      console.log(formatted) // +1 (123) 456-78-90
                      //console.log(extracted) // 1234567890
//                    }}
//        mask={"+1 ([000]) [000] [00] [00]"}
      />

    </View>
  )
}

const styles = StyleSheet.create({
  conatiner:{
    flex:1,
    paddingHorizontal: 4,
    paddingTop: Constants.statusBarHeight,
    backgroundColor:'#aaa',
    alignItems: 'center',
    justifyContent: "center"
  },
  inputText:{
    backgroundColor:'#fff',
    width: 100,
    height: 30
  }
})
