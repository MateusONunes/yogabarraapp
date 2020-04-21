import React, { useState, useEffect } from 'react';
import { useNavigation } from '@react-navigation/native';
import { View, FlatList, Image, Text, TouchableOpacity, StyleSheet } from 'react-native';

import api from '../services/api';
import img from '../../assets/splash.png';

export default function Incidents() {
  console.log('XX')

  const [pers_pers, setPers_pers] = useState([]);
  const [total, setTotal] = useState(0);

  const [page, setPage] = useState(1);
  const [loading, setLoading] = useState(false);

  const navigation = useNavigation();

  async function loadPers_pers() {
    if (loading) {
      return;
    }

    if (total > 0 && pers_pers.length === total) {
      return;
    }

    setLoading(true);

    const response = await api.get('routesquerystudent', {
      params: { page }
    });

    setPers_pers([...pers_pers, ...response.data]);
    setTotal(response.headers['x-total-count']);
    setPage(page + 1);
    setLoading(false);
  }

  useEffect(() => {
    loadPers_pers();
  }, []);
 
  return (
    <View style={{flex: 1}}>
      <Image source={img} />
      <View style={styles.header}>
        <Text style={styles.headerText}>
          Total de <Text style={styles.headerTextBold}>{total} Estudantes</Text>.
        </Text>
      </View>

      <Text style={styles.title}>Bem-vindo!</Text>
      <Text style={styles.description}>Escolha um dos casos abaixo e salve o dia.</Text>

      <FlatList
        data={pers_pers}
        style={styles.flatlist}
        keyExtractor={pers_pers => String(pers_pers.id)}
        // showsVerticalScrollIndicator={false}
        onEndReached={loadPers_pers}
        onEndReachedThreshold={0.2}
        renderItem={({ item: pers_pers }) => (
          <View style={styles.containerflatlist0}>
            <View style={styles.containerflatlist}>
            <Text>{pers_pers.name_pers}</Text>
            <Text>{pers_pers.address_pers}</Text>

              <TouchableOpacity 
                style={styles.detailsButton} 
                onPress={() => navigate.navigation('student', { navigation })}
              >
              </TouchableOpacity>
            </View>
            <View style= {styles.detailPerson}>
              <Text style= {styles.textPerson}>Ver</Text>
            </View>
          </View>
        )}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  flatlist: {
    marginTop: 32,  
  },
  containerflatlist0: {
    flex: 1, 
    flexDirection: 'row',
    marginBottom: 3,
    padding: 3,
    backgroundColor: "#f48cff"
    
  },
  containerflatlist: {
    flex:1,

  },
  detailsButton: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center'
  },
  detailsButtonText: {
    color: '#e02041',
    fontSize: 15,
    fontWeight: 'bold'
  },  
  detailPerson: {
    backgroundColor:"#aaa", 
    width: 30, 
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#ad03fc"
  },
  textPerson: {
    color: "#fff",
    justifyContent: "center",
    textDecorationLine: 'underline'
  }
})