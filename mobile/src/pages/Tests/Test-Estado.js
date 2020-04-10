//https://www.youtube.com/watch?v=icnQ-tuHup4&t=1028s - Felipe Fontoura - Canal Dev Samurai

import React, { useState} from 'react';
import { View, Text, TextInput, StyleSheet } from 'react-native';
import constants from 'expo-constants';

export default function App (){
  const [myText, setMyText] = useState('Meu texto');

  return(
    <View style={styles.container}>
      <Text>ENTRADA:</Text>
      <TextInput
        value={myText}
        style={{backgroundColor : '#AAA', height: 50, width: '100%'}}
        onChangeText={text => {setMyText(text)}}/>
      <Text>SAIDA:</Text>
      <Text>{myText}</Text>
    </View>
  );
}
 
const styles = StyleSheet.create({
  container: {
    paddingTop: constants.statusBarHeight,
    flex: 1,
    justifyContent: "center",
    alignItems: "center"
  }
})
