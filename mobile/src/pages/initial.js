import React from 'react'
import { useNavigation } from '@react-navigation/native';
import { MaterialCommunityIcons } from '@expo/vector-icons'
import { View, Image, Text, TouchableOpacity } from 'react-native'

import styles from './initialstyle'
import img from '../../assets/splash.png'


export default function Initial() {
    const navigation = useNavigation();

    function navigateToLogin() {
        navigation.navigate('login');
    }

    function navigateTostudent() {
        navigation.navigate('Student');
    }
      
    
    return (
      <View style={styles.container}>
        <Image source= {img} />

        <TouchableOpacity style={styles.enterbox} onPress={() => navigateTostudent()}>
            <Text style={styles.defaulttext}>Cadastrar Aluno</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.enterbox}>
            <Text style={styles.defaulttext}>Aulas e Preços</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.enterbox}>
            <Text style={styles.defaulttext}>Meus Pagamentos</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.enterbox}>
            <Text style={styles.defaulttext}>Presenças</Text>
        </TouchableOpacity>

        <TouchableOpacity style={styles.enterbox} onPress={() => navigateToLogin()}>
            <Text style={styles.defaulttext}>Voltar</Text>
        </TouchableOpacity>


      </View>
  
    )

}