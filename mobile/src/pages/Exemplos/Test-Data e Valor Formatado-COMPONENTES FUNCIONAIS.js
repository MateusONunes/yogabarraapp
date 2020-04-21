import React, {Component, useState} from 'react';
import { View,StyleSheet,TextInput,Text,Button} from 'react-native';
import { TextInputMask } from 'react-native-masked-text'; //You can check the package on github to see more masking options

export default function App (){

  const [dt, setMydt] = useState('');  
  
   return (
       <View style={styles.container}>
         <Text>Enter Date (YYYY/MM/DD)</Text>
          <TextInputMask
             style={{width: '50%',height: 40,backgroundColor: 'white',justifyContent: 'center'}}
              type={'datetime'}
              options={{
                format: 'DD/MM/YYYY'
              }}
              value={dt}
              onChangeText={text => { setMydt(text)}}
            />
       </View>
       );
}

const styles = StyleSheet.create({


  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#8ee3ab',
  },
});