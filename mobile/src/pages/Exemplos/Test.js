import React from 'react';
import {Button, View, ScrollView, Image, Text} from 'react-native';
//import Input from './components/Form/Input';

import styles from './studentStyle';
import globalstyle from './globalstyle';
import img from '../../assets/splash.png';

export default function Student() {
  return (
    <ScrollView style={{flex: 1, backgroundColor: "#eee",  borderWidth: 2, marginVertical: 10}}>
      <View style={{flex: 1, backgroundColor:"#aaa", borderColor: "#dea60d", borderWidth: 2, paddingHorizontal:10 }}>
      </View>
    </ScrollView>
  );
}
