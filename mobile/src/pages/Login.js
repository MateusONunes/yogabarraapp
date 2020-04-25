import React from 'react'
import { useNavigation } from '@react-navigation/native';
//import { MaterialCommunityIcons } from '@expo/vector-icons'
import { View, Image, Text, TouchableOpacity } from 'react-native'

import styles from './LoginStyle'
import img from '../../assets/splash.png'

export default function Initial() {

    const navigation = useNavigation();

    return (
      <View style={styles.container}>
        <Image source= {img} />
        <Text style={styles.header}>Seja Bem Vindo</Text>

        <TouchableOpacity 
              style={styles.enterbox} 
              onPress={() => navigation.navigate('Initial')}
        >
            <Text style={styles.defaulttext}>Entrar</Text>
        </TouchableOpacity>
      </View>
  
    )

}
