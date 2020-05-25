import React from 'react'
import { View, Text, StyleSheet } from 'react-native';
import Constants from 'expo-constants'
//import styles from './ArquivoStyle'

export default function Test() {
  return (
    <View style={[styles.conatiner, {marginTop: 20}]}>
      <Text>
        Hello Word
      </Text>
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
    backgroundColor:'#aaa',
  }
})
